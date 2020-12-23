import { writable } from 'svelte/store';

export const configManager = {
    defaultData: {
        ledCount: 24,
        pattern: [
            {angleOffset: 0, colorR: 20, colorG: 80, colorB: 254},
            {angleOffset: 180, colorR: 120, colorG: 254, colorB: 20},
        ],
    },

    get: () => {
        return deviceConfig;
    },
    
    set: (_cfg) => {
        configStore.set(_cfg);
    },
    setPattern: (pattern) => {
        let _cfg = deviceConfig;
        _cfg.pattern = pattern;
        console.log("Update store", _cfg);
        configStore.set(_cfg);
    },
    setPatternStep: (angle, colorR, colorG, colorB) => {
        let _cfg = deviceConfig;        
        // remove any existing step for this angle
        _cfg.pattern = _cfg.pattern.filter((patternStep) => {
            return patternStep.angleOffset != angle;
        })
        if (colorR != 0 && colorG != 0 && colorB != 0) {
            // add new step (if not black/off)
            _cfg.pattern.push(
                {angleOffset: angle, colorR: colorR, colorG: colorG, colorB: colorB},
            );
        }
        configStore.set(_cfg);
    }
};

export const configStore = writable(configManager.defaultData);

let deviceConfig;
const unsubscribeConfigStore = configStore.subscribe(value => {
    deviceConfig = value;
});