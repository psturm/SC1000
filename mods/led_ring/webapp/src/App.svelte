<svelte:head>
	<title>SC1000 LED Ring</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,600,700">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Mono">
</svelte:head>

<script>
	import About from './components/About.svelte';
	import ColorWheel from './components/ColorWheel.svelte';
	import CopyPasteCode from './components/CopyPasteCode.svelte';
	import Device from './components/Device.svelte';

	import TopAppBar, {Row, Section, Title} from '@smui/top-app-bar';
</script>


<main>

	<TopAppBar variant="static" color="primary">
        <Row>
          <Section>
            <Title>SC1000 LED Ring Configurator</Title>
          </Section>
        </Row>
    </TopAppBar>

	<div class="wrapper">
		<Device/>
		<ColorWheel/>
		<CopyPasteCode/>

		<About/>
	</div>

</main>



<style>
.wrapper {
	margin: 0 auto;
	max-width: 500px;
}
</style>