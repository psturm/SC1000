<script>
import { configManager } from '../stores.js';

import List, {Item, Text} from '@smui/list';
import Select, {Option} from '@smui/select';
import Menu from '@smui/menu';
import Button from '@smui/button';

let menu;

const presets = {
    "Single: white": [
        {angleOffset: 0, colorR: 255, colorG: 255, colorB: 255},
    ],
    "Single: blue": [
        {angleOffset: 0, colorR: 0, colorG: 0, colorB: 255},
    ],
    "Single: red": [
        {angleOffset: 0, colorR: 255, colorG: 0, colorB: 0},
    ],

    "Single: inverted blue": [
        {angleOffset: 15, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 30, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 45, colorR: 64, colorG: 64, colorB: 128},     
        {angleOffset: 60, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 75, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 90, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 105, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 120, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 135, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 150, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 165, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 180, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 195, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 210, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 225, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 240, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 255, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 270, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 285, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 300, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 315, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 330, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 345, colorR: 64, colorG: 64, colorB: 128},
    ],

    "Single: inverted blue with white": [
        {angleOffset: 0, colorR: 255, colorG: 255, colorB: 255},
        {angleOffset: 15, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 30, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 45, colorR: 64, colorG: 64, colorB: 128},     
        {angleOffset: 60, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 75, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 90, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 105, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 120, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 135, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 150, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 165, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 180, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 195, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 210, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 225, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 240, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 255, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 270, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 285, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 300, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 315, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 330, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 345, colorR: 64, colorG: 64, colorB: 128},
    ],

    "Single: inverted blue with red": [
        {angleOffset: 0, colorR: 255, colorG: 0, colorB: 0},
        {angleOffset: 15, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 30, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 45, colorR: 64, colorG: 64, colorB: 128},     
        {angleOffset: 60, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 75, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 90, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 105, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 120, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 135, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 150, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 165, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 180, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 195, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 210, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 225, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 240, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 255, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 270, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 285, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 300, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 315, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 330, colorR: 64, colorG: 64, colorB: 128},
        {angleOffset: 345, colorR: 64, colorG: 64, colorB: 128},
    ],    

    "Double: white yellow": [
        {angleOffset: 0, colorR: 255, colorG: 255, colorB: 255},
        {angleOffset: 180, colorR: 255, colorG: 255, colorB: 0},
    ],
    "Double: purple green": [
        {angleOffset: 0, colorR: 255, colorG: 0, colorB: 255},
        {angleOffset: 180, colorR: 0, colorG: 255, colorB: 0},
    ],

    "Triple: white blue red": [
        {angleOffset: 0, colorR: 255, colorG: 255, colorB: 255},
        {angleOffset: 120, colorR: 0, colorG: 0, colorB: 255},
        {angleOffset: 240, colorR: 255, colorG: 0, colorB: 0},
    ],

    "Quadruple: white blue white blue ": [
        {angleOffset: 0, colorR: 255, colorG: 255, colorB: 255},
        {angleOffset: 90, colorR: 0, colorG: 0, colorB: 255},
        {angleOffset: 180, colorR: 255, colorG: 255, colorB: 255},
        {angleOffset: 270, colorR: 0, colorG: 0, colorB: 255},
    ],

    "Quadruple: yell blue green red": [
        {angleOffset: 0, colorR: 255, colorG: 255, colorB: 0},
        {angleOffset: 90, colorR: 0, colorG: 0, colorB: 255},
        {angleOffset: 180, colorR: 0, colorG: 255, colorB: 0},
        {angleOffset: 270, colorR: 255, colorG: 0, colorB: 0},
    ],

    "Rainbow (double mini)": [
        {angleOffset: 120, colorR: 0, colorG: 251, colorB: 255},
        {angleOffset: 135, colorR: 0, colorG: 251, colorB: 255},
        {angleOffset: 150, colorR: 0, colorG: 197, colorB: 255},
        {angleOffset: 165, colorR: 0, colorG: 128, colorB: 255},
        {angleOffset: 180, colorR: 0, colorG: 67, colorB: 255},

        {angleOffset: 300, colorR: 255, colorG: 223, colorB: 0},
        {angleOffset: 315, colorR: 255, colorG: 223, colorB: 0},
        {angleOffset: 330, colorR: 255, colorG: 177, colorB: 0},
        {angleOffset: 345, colorR: 255, colorG: 108, colorB: 0},
        {angleOffset: 0, colorR: 255, colorG: 0, colorB: 0},
    ],

    "Rainbow": [
        {angleOffset: 0, colorR: 255, colorG: 0, colorB: 0},
        {angleOffset: 15, colorR: 255, colorG: 0, colorB: 64},
        {angleOffset: 30, colorR: 255, colorG: 0, colorB: 128},
        {angleOffset: 45, colorR: 255, colorG: 0, colorB: 192},
        
        {angleOffset: 60, colorR: 255, colorG: 0, colorB: 255},
        {angleOffset: 75, colorR: 192, colorG: 0, colorB: 255},
        {angleOffset: 90, colorR: 128, colorG: 0, colorB: 255},
        {angleOffset: 105, colorR: 64, colorG: 0, colorB: 255},
        
        {angleOffset: 120, colorR: 0, colorG: 0, colorB: 255},
        {angleOffset: 135, colorR: 0, colorG: 64, colorB: 255},
        {angleOffset: 150, colorR: 0, colorG: 128, colorB: 255},
        {angleOffset: 165, colorR: 0, colorG: 192, colorB: 255},
        
        {angleOffset: 180, colorR: 0, colorG: 255, colorB: 255},
        {angleOffset: 195, colorR: 0, colorG: 255, colorB: 192},
        {angleOffset: 210, colorR: 0, colorG: 255, colorB: 128},
        {angleOffset: 225, colorR: 0, colorG: 255, colorB: 64},
        
        {angleOffset: 240, colorR: 0, colorG: 255, colorB: 0},
        {angleOffset: 255, colorR: 64, colorG: 255, colorB: 0},
        {angleOffset: 270, colorR: 128, colorG: 255, colorB: 0},
        {angleOffset: 285, colorR: 192, colorG: 255, colorB: 0},
        
        {angleOffset: 300, colorR: 255, colorG: 255, colorB: 0},
        {angleOffset: 315, colorR: 255, colorG: 192, colorB: 0},
        {angleOffset: 330, colorR: 255, colorG: 128, colorB: 0},
        {angleOffset: 345, colorR: 255, colorG: 64, colorB: 0},
    ],

    "Quarters": [
        {angleOffset: 0, colorR: 0, colorG: 197, colorB: 255},
        {angleOffset: 15, colorR: 0, colorG: 197, colorB: 255},
        {angleOffset: 30, colorR: 0, colorG: 197, colorB: 255},
        {angleOffset: 45, colorR: 0, colorG: 197, colorB: 255},
        {angleOffset: 60, colorR: 0, colorG: 197, colorB: 255},
        {angleOffset: 75, colorR: 0, colorG: 197, colorB: 255},

        {angleOffset: 90, colorR: 255, colorG: 177, colorB: 0},
        {angleOffset: 105, colorR: 255, colorG: 177, colorB: 0},
        {angleOffset: 120, colorR: 255, colorG: 177, colorB: 0},
        {angleOffset: 135, colorR: 255, colorG: 177, colorB: 0},
        {angleOffset: 150, colorR: 255, colorG: 177, colorB: 0},
        {angleOffset: 165, colorR: 255, colorG: 177, colorB: 0},

        {angleOffset: 180, colorR: 0, colorG: 197, colorB: 255},
        {angleOffset: 195, colorR: 0, colorG: 197, colorB: 255},
        {angleOffset: 210, colorR: 0, colorG: 197, colorB: 255},
        {angleOffset: 225, colorR: 0, colorG: 197, colorB: 255},
        {angleOffset: 240, colorR: 0, colorG: 197, colorB: 255},
        {angleOffset: 255, colorR: 0, colorG: 197, colorB: 255},        

        {angleOffset: 270, colorR: 255, colorG: 177, colorB: 0},
        {angleOffset: 285, colorR: 255, colorG: 177, colorB: 0},
        {angleOffset: 300, colorR: 255, colorG: 177, colorB: 0},
        {angleOffset: 315, colorR: 255, colorG: 177, colorB: 0},
        {angleOffset: 330, colorR: 255, colorG: 177, colorB: 0},
        {angleOffset: 345, colorR: 255, colorG: 177, colorB: 0},
    ],
}

const handlePresetSubmit = (foo) => {
    console.log("handlePresetSubmit", foo)
}

const loadPreset = (patternName) => {
    console.log("loadPreset", patternName);
    if (!presets.hasOwnProperty(patternName)) {
        console.log("Unknown preset patternName:", patternName);
        return;
    }

    let pattern = presets[patternName];
    configManager.setPattern(pattern);
    console.log("preset pattern", pattern);
}

</script>


<Button on:click={() => menu.setOpen(true)} variant="raised">Select preset</Button>
<Menu bind:this={menu}>
    <List>
    {#each Object.keys(presets) as presetName }
        <Item on:SMUI:action={() => loadPreset(presetName)}>
            <Text>{presetName}</Text>
        </Item>
    {/each}
    </List>
</Menu>



<style>
.presets-list li {
    cursor: pointer;
}
</style>