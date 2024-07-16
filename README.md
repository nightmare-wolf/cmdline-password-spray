# CMDline-Password-Spray

## Overview
CMDline-Password-Spray is a command-line tool (.bat file) designed to perform a password spray attack. This script was inspired by Carrie Roberts' original version, which can be found [here](https://gist.github.com/clr2of8/a30cba6494e5b93319a010b9e9f6fe7f#file-pwd-spray-for-loop-basic-bat).

The original script didn't work for me as intended, so I made modifications to ensure it functions correctly. My modified version has been successfully used in a recent engagement.

## Features
- Queries Active Directory (AD) for a list of usernames.
- Creates a list of usernames in the temp directory.
- Performs a password spray attack against the Domain Controller (DC) using the generated username list and a specified password.

## Usage
1. Set your password in the 'set password' field within the .bat file.
2. Run the script from the command line.

## Warning
**Important:** Use this script only with proper authorization and written consent. Unauthorized use of this script is illegal and unethical. The author is not responsible for any misuse or damage caused by this script.

## Contribution
If you would like to contribute to making this script better, feel free to submit a pull request or open an issue.

## License
This project is open-source and available under the MIT License.

## Acknowledgements
Special thanks to Carrie Roberts (@OrOneEqualsOne) for the original version of the script.

## Disclaimer
I am not responsible for any unauthorized use of this script. Ensure you have explicit permission before using this tool in any environment.

