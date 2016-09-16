<cfscript>

title = "Example of parsing YAML file into Coldfusion/Lucee, using jyaml and JavaLoader";
ymlFilePath = expandPath("./data.yml");
ymlContent = fileRead(ymlFilePath);

// loadpaths is an array of paths to the jar files
// they can point to individual jar file
// or they can point to diretories (then all the jar files in the directories will be loaded)
jarLoadPaths = [
	'#expandPath("./jyaml-1.3.jar")#'
	//, 'expandPath("./more_jar_class_here")'
];
javaloader = createObject("component", "javaloader.JavaLoader").init(jarLoadPaths);

yaml = javaloader.create("org.ho.yaml.Yaml");
//WriteDump(yaml);

dataFile = CreateObject("java", "java.io.File").init( ymlFilePath );
data = yaml.load(dataFile);

// Access the data with [] notation, don't use the dot notation
// WriteDump( data["name"] );
// WriteDump( arrayToList( data["skill"] ) );
// WriteDump( isBoolean( data["retired"] ) );

</cfscript>

<cfoutput>
<html>
<head>
	<title>#title#</title>
	<link href="https://fonts.googleapis.com/css?family=PT+Mono" rel="stylesheet">
	<style>
		*, body, td {
			font-family: 'PT Mono', monospace;
			font-size: 11px;
		}
		h1 { font-size: 24px; }
		h4 { font-size: 16px; }
		pre { font-size: 11px; }
	</style>
</head>
<body>
	<h1>#title#</h1>
	<h4>Yaml data</h4>
	<blockquote><pre>#ymlContent#</pre></blockquote>

	<h4>Parsed data</h4>
	<cfdump var="#data#">

	<h4>Access the data with [] notation, not the dot notation</h4>
	<p>WriteDump( data["name"] ); 
		<cfdump var="#data["name"]#"></p>
	<p>WriteDump( arrayToList( data["skill"] );
		<cfdump var="#arrayToList( data["skill"] )#"></p>
	<p>WriteDump( isBoolean( data["retired"] ) ); 
		<cfdump var="#isBoolean( data["retired"] )#"></p>
</body>
</html>
</cfoutput>