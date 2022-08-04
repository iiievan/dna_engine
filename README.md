Engine for modeling DNA replication and the formation of proteins from amino acids. Builded on Visual stuido 2019.
Premake system is used to generate a project under visual stuido.(https://github.com/premake/premake-core)

To build the project, you need:
- download premake from the link: https://github.com/premake/premake-core/tags.(for windows) 
- delete folders ~/bin and ~/bin-int in the root directory of project deleteif they exist.
- and just in case remove the solution file for VS - dna_engine.sln
- unpack .zip to ~/vendor/bin/premake at the root of the project.
- run GenerateProject with Administrator rules.
- run solution and run "rebuild all".
