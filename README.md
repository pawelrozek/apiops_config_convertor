# apiops_config_convertor
This script will take the configuration.env.yml file and convert the format from v1.0.0 to v2.0.0 where the breaking changes were introduced


Version v2.0.0 of [APIOps Toolkit for Azure APIM] (https://github.com/Azure/apiops/releases/tag/v2.0.0) introduced a new format of the configuration.env.yaml file.
Instead of going manually and adding extra spaces and the "Properties" this script will do that for you.
Please note this script is very basic and works only with properly formatted yaml files.

## Usage:

To use the script, download the bash script and run it using ./converter.sh. If you supply filename as input, (./converter.sh configuration.prd.yaml) you will not be asked for filename at runtime.
If you don't provide a file name, you will be asked at the start of the program.
For best results, please have the script in the same directory as your configuration file.
