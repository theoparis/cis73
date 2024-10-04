# CIS73 Raspberry Pi Setup

```shell
ssh -L 8888:localhost:8888 your.pi.address

curl -sSf -L https://install.lix.systems/lix | sh -s -- install
git clone https://github.com/theoparis/cis73
cd cis73
nix develop
jupyter notebook
```
