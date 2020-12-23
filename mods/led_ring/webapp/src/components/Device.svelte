<script>
import { configManager } from '../stores.js';

import Button, {Label, Icon} from '@smui/button';
import Card, {Content, Actions, ActionButtons, ActionIcons} from '@smui/card';
import IconButton from '@smui/icon-button';
import LinearProgress from '@smui/linear-progress';


let hasDevice = false, fetchingConfigInProgress = false;
const ip = "192.168.23.5";

class DeviceClient {
    constructor(ip) {
        this.ip = ip;
    }

    _getBaseUrl() {
        return "http://" + this.ip + "/"
    }

    _fetchConfigFromDevice() {
        return new Promise((resolve, reject) => {
            fetch(this._getBaseUrl())
                .then((response) => { return response.json()})
                .then((configJson) => { 
                    if (configJson.hasOwnProperty("ledCount") && configJson.hasOwnProperty("pattern")) {
                        resolve(configJson); 
                    } else {
                        reject("Wrong data in JSON repsonse.");
                    }
                })
            .catch((error) => { reject(error); });
        });
    }

    loadConfig() {
        fetchingConfigInProgress = true;
        this._fetchConfigFromDevice().then((configJson) => {
            configJson.pattern = configJson.pattern.map(pattern_step => {
                return {
                    angleOffset: pattern_step.a,
                    colorR: pattern_step.r,
                    colorG: pattern_step.g,
                    colorB: pattern_step.b,
                }
            });
            // save the config in the store
            configManager.set(configJson);

            hasDevice = true;
            fetchingConfigInProgress = false;
        }).catch((error) => {
            console.log("FAILED loading config from device", error);
            hasDevice = false;
            fetchingConfigInProgress = false;
        });
    }

    writeConfigToDevice() {
        let patterStepsFormatted = configManager.get().pattern.map((patternStep) => {
            return `${patternStep.angleOffset},${patternStep.colorR},${patternStep.colorG},${patternStep.colorB}`;
        });        
        let payload = "pattern=" + patterStepsFormatted.join(";");
        
        const response = fetch(this._getBaseUrl(), {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: payload,
            mode: "no-cors",
        });
    }
}

const deviceClient = new DeviceClient(ip);
deviceClient.loadConfig();

</script>


<Card>
    <Content>
        <h2 class="mdc-typography--headline6">
            Device
            <span class="text-small">(IP: {ip})</span>
        </h2>

        {#if fetchingConfigInProgress}
            <div>Searching for device to fetch config ..</div>
            <br/>
            <LinearProgress indeterminate />
        {:else}
            {#if !hasDevice}
                <p>
                    <Icon class="material-icons">phonelink_erase</Icon>
                    No device found.
                </p>
                <p>
                    Make sure you are connected to the wifi of the LED Ring.
                </p>
                <p>
                    Alternatively you can create a pattern configuration below and copy the generated <span class="code">PATTERN</span> to your configuration file manually.
                </p>
            {:else}
                <p>
                    <Icon class="material-icons">phonelink_ring</Icon>
                    Device found.
                </p>
            {/if}
        {/if}

    </Content>
    <Actions>    
        <ActionButtons>
        {#if hasDevice}
            <Button on:click={() => deviceClient.writeConfigToDevice()}>
                <Label>Upload current pattern to device</Label>
            </Button>
        {/if}
        </ActionButtons>
        <ActionIcons>
            <IconButton class="material-icons" on:click={() => deviceClient.loadConfig()} title="Reload config from device">refresh</IconButton>
        </ActionIcons>
    </Actions>
</Card>



<style>

</style>