<script>
import { configManager } from '../stores.js';

import List, {Group, Item, Graphic, Meta, Label, Separator, Subheader, Text, PrimaryText, SecondaryText} from '@smui/list';
import Select, {Option} from '@smui/select';
import Menu, {SelectionGroup, SelectionGroupIcon} from '@smui/menu';
import {Anchor} from '@smui/menu-surface';
import Button from '@smui/button';

let menu;

const presets = {
    "single__white": [
        {angleOffset: 0, colorR: 255, colorG: 255, colorB: 255},
    ],
    "single__blue": [
        {angleOffset: 0, colorR: 0, colorG: 0, colorB: 255},
    ],
    "single__red": [
        {angleOffset: 0, colorR: 255, colorG: 0, colorB: 0},
    ],

    "double__white_blue": [
        {angleOffset: 0, colorR: 255, colorG: 255, colorB: 255},
        {angleOffset: 180, colorR: 0, colorG: 0, colorB: 255},
    ],
    "double__purple_green": [
        {angleOffset: 0, colorR: 255, colorG: 0, colorB: 255},
        {angleOffset: 180, colorR: 0, colorG: 255, colorB: 0},
    ],

    "triple__white_blue_red": [
        {angleOffset: 0, colorR: 255, colorG: 255, colorB: 255},
        {angleOffset: 120, colorR: 0, colorG: 0, colorB: 255},
        {angleOffset: 240, colorR: 255, colorG: 0, colorB: 0},
    ],

    "rainbow_1": [
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

    "quarters": [
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



<Button on:click={() => menu.setOpen(true)}>Select preset</Button>
<Menu bind:this={menu}>
<List>
{#each Object.keys(presets) as presetName }
    <Item on:SMUI:action={() => loadPreset(presetName)}><Text>{presetName}</Text></Item>
{/each}
</List>
</Menu>



<style>
.presets-list li {
    cursor: pointer;
}
</style>