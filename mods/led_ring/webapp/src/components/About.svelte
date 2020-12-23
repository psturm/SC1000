<script>   
import Card, {Content} from '@smui/card';
</script>


<div class="about-container">
  <Card>
    <Content>
      <h2>About</h2>
      <p>
        A small web app to configure the LED ring pattern on your SC1000. Either directly connect to the wifi of the LED ring to directly configure it or copy the generated code into the LUA <span class="code">pattern.lua</span> config.
      </p>
      <p>
        This app is part of the <a href="https://github.com/rasteri/SC1000" target="_blank" title="github.com/rasteri/SC1000">SC1000 project</a>.
      </p>
    </Content>
  </Card>
</div>


<style>
.about-container {
  margin-top: 70px;
}
</style>