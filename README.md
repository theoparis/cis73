# CIS73 Raspberry Pi Setup

```shell
ssh -L 8888:localhost:8888 your.pi.address

curl -sSf -L https://install.lix.systems/lix | sh -s -- install
git clone https://github.com/theoparis/cis73
cd cis73
nix develop
python3 -m venv .venv
source .venv/bin/activate
pip3 install --upgrade -r requirements.txt
jupyter notebook
```
