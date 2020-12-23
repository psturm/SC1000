<script>   
import { configManager, configStore } from '../stores.js';
import { hexToRgb, rgbToHex } from './color-helpers.js';
import { angleToLedPosition, ledPositionToAngle } from './rotation-helpers.js';

import PresetsButton from './PresetsButton.svelte';

import Card, {Content, Actions, ActionButtons, ActionIcons} from '@smui/card';


let deviceConfig;
const unsubscribeLedPatternConfig = configStore.subscribe(value => {
    deviceConfig = value;
});


let w; // read-only binding for the container width

let ledConfigs, ledCount;
let tan, degreePerLed;

const colorOffHex = "#000000";

$: { /* Rerun this whole block, if the config changed */

    ledCount = deviceConfig.ledCount;
    tan = Math.tan(Math.PI/ledCount);
    degreePerLed = 360 / ledCount;

    // Initialize the LED config list for all possible LEDs
    ledConfigs = [];
    for (let idx = 0; idx < ledCount; idx++) {
        const ledPos = idx + 1;
        ledConfigs[idx] = {
            color: {r: 0, g: 0, b:0},
            colorHex: colorOffHex,
            angleOffset: ledPositionToAngle(ledPos, degreePerLed),
        };
    }

    // Update the LED config from pattern (set colors)
    for (let patternStep of deviceConfig.pattern) {
        let pos = angleToLedPosition(patternStep.angleOffset, degreePerLed);
        let idx = pos - 1;
        ledConfigs[idx].color = {r: patternStep.colorR, g: patternStep.colorG, b:patternStep.colorB};
        ledConfigs[idx].colorHex = rgbToHex(
            patternStep.colorR, patternStep.colorG, patternStep.colorB
        );
    }
}

const setColorForLED = (ev, ledPos) => {
    const color = hexToRgb(ev.target.value);
    const _angle = ledPositionToAngle(ledPos, degreePerLed);
    configManager.setPatternStep(_angle, color.r, color.g, color.b);
}
</script>


<Card>
    <Content>
        <h2 class="mdc-typography--headline6">Pattern configuratorn</h2>
        <p>
            LED count: {ledCount} <span class="text-small">(results in {degreePerLed}° rotation per LED)</span>
        </p>

        <!-- Circular Design based on https://stackoverflow.com/questions/12813573/position-icons-into-circle -->
        <div class="color-wheel" style="--m: {ledCount}; --tan: {tan}; --w: {w}" bind:clientWidth="{w}">
        {#each ledConfigs as ledConfig, idx}
            <input style="--i: {idx}" 
                type="color" 
                value="{ledConfig.colorHex}" 
                name="c-{idx}" 
                class="colorpicker {ledConfig.colorHex === colorOffHex ? 'colorpicker-non-active' : ''}" 
                on:change={(ev) => setColorForLED(ev, idx+1)}
                title="{ledConfig.angleOffset}° - LED position {idx+1} (index {idx})"
                />
                
        {/each}
        </div>
    </Content>
    <Actions>
        <ActionButtons>
            <PresetsButton/>
        </ActionButtons>
    </Actions>
</Card>

<style>
.color-wheel {
  --d: calc(1px * var(--w) / (var(--m)*2.6) ); /* element size */
  --r: calc(.5*var(--d)/var(--tan)); /* circle radius */
  --s: calc(2*var(--r) + var(--d)); /* minimum container size */
  position: relative;
  min-width: var(--s);
  min-height: var(--s);
  margin-top: 15px;
}
.color-wheel .colorpicker {
  position: absolute;
  top: 50%; left: 50%;
  width: var(--d); 
  height: var(--d);
  margin: calc(-.5*var(--d));
  padding: 0;
  border: 1px solid white;
  --az: calc(1turn*(var(--i))/var(--m) + 0.75turn); /* +0.75turn to put 0° on top*/
  transform: rotate(var(--az)) translate(var(--r)); 
  cursor: pointer;
}
.color-wheel .colorpicker-non-active {
  opacity: 0.2;
  border: 1px dotted black;
}
</style>