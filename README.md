# cf-yaml-example
A CF/Lucee example of readding yaml file using jyaml.jar

## Requirements
* jyaml.jar 
  * [https://github.com/bibliocommons/jyaml](https://github.com/bibliocommons/jyaml) - Forked and hosted in GitHub
  * [https://sourceforge.net/projects/jyaml/files/](https://sourceforge.net/projects/jyaml/files/) - The original one hosted in SourceForge
* JavaLoader.cfc
  * [https://github.com/markmandel/JavaLoader](https://github.com/markmandel/JavaLoader)

## Load yaml.jar
```javascript
// Load jyml.jar with JavaLoader
javaloader = createObject("component", "javaloader.JavaLoader").init( expandPath("./jyaml-1.3.jar") );
// Create jyml class
yaml = javaloader.create("org.ho.yaml.Yaml");
```

## Read the yaml file
```javascript
dataFile = createObject("java", "java.io.File").init( expandPath("./data.yml") );
data = yaml.load(dataFile);
```

## Access the data structure with [ ] notation, the dot notation won't work
```javascript
// This works
WriteDump( data["name"] );
// This will throw error
WriteDump( data.name );
```
