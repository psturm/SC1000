<script>   
import { configStore } from '../stores.js';

import Card, {Content, Actions, ActionButtons, ActionIcons} from '@smui/card';


let deviceConfig;
const unsubscribeLedPatternConfig = configStore.subscribe(value => {
    deviceConfig = value;
});
</script>


<Card>
    <Content>
        <h2>LUA code</h2>
        <p>
          LUA code to be copy & pasted directly to <span class="code">pattern.lua</span> file.
        </p>

        <pre class="pre">
PATTERN = {'{'}
{#each deviceConfig.pattern as patternStep}
  {'  {angle_offset='+patternStep.angleOffset+', r='+patternStep.colorR+', g='+patternStep.colorG+', b='+patternStep.colorB+'},'}
{/each}{'}'}
        </pre>
    </Content>
</Card>


<style>
.pre {
  color: #444;
  padding: 10px;
  background: #dddddd;
  border-radius: 5px;
}
</style>