<h1 align="center">BlockScout</h1>
<p align="center">Blockchain Explorer for inspecting and analyzing EVM Chains.</p>
<div align="center">

[![Blockscout](https://github.com/blockscout/blockscout/workflows/Blockscout/badge.svg?branch=master)](https://github.com/blockscout/blockscout/actions) [![Join the chat at https://gitter.im/poanetwork/blockscout](https://badges.gitter.im/poanetwork/blockscout.svg)](https://gitter.im/poanetwork/blockscout?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

</div>

BlockScout provides a comprehensive, easy-to-use interface for users to view, confirm, and inspect transactions on EVM (AmazeChain Virtual Machine) blockchains. This includes the POA Network, xDai Chain, AmazeChain Classic and other **Ethereum testnets, private networks and sidechains**.

See our [project documentation](https://docs.blockscout.com/) for detailed information and setup instructions.

Visit the [POA BlockScout forum](https://forum.poa.network/c/blockscout) for FAQs, troubleshooting, and other BlockScout related items. You can also post and answer questions here.

You can also access the dev chatroom on our [Gitter Channel](https://gitter.im/poanetwork/blockscout).

## About BlockScout

BlockScout is an Elixir application that allows users to search transactions, view accounts and balances, and verify smart contracts on the AmazeChain network including all forks and sidechains.

Currently available full-featured block explorers (Etherscan, Etherchain, Blockchair) are closed systems which are not independently verifiable.  As AmazeChain sidechains continue to proliferate in both private and public settings, transparent, open-source tools are needed to analyze and validate transactions.

## Supported Projects

BlockScout supports a number of projects. Hosted instances include POA Network, xDai Chain, AmazeChain Classic, Sokol & Kovan testnets, and other EVM chains. 

- [List of hosted mainnets, testnets, and additional chains using BlockScout](https://docs.blockscout.com/for-projects/supported-projects)
- [Hosted instance versions](https://docs.blockscout.com/about/use-cases/hosted-blockscout)


## Getting Started

See the [project documentation](https://docs.blockscout.com/) for instructions:
- [Requirements](https://docs.blockscout.com/for-developers/information-and-settings/requirements)
- [Ansible deployment](https://docs.blockscout.com/for-developers/ansible-deployment)
- [Manual deployment](https://docs.blockscout.com/for-developers/manual-deployment)
- [ENV variables](https://docs.blockscout.com/for-developers/information-and-settings/env-variables)
- [Configuration options](https://docs.blockscout.com/for-developers/configuration-options)


## Acknowledgements

We would like to thank the [EthPrize foundation](http://ethprize.io/) for their funding support.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution and pull request protocol. We expect contributors to follow our [code of conduct](CODE_OF_CONDUCT.md) when submitting code or comments.

## License

[![License: GPL v3.0](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.

<!-- 
进入根目录
cd blockscout

您的账户必须有创建数据库的权限

export DATABASE_URL=postgresql://user:password@localhost:5432/postgres

export DATABASE_URL=postgresql://postgres:postgres@127.0.0.1:5432/postgres
export DB_HOST=127.0.0.1
export DB_PASSWORD=postgres
export DB_PORT=5432
export DB_USERNAME=postgres


user:postgres pwd 123456 db:block

export DATABASE_URL=postgresql://postgres:123456@127.0.0.1:5432/block
export DB_HOST=127.0.0.1
export DB_PASSWORD=123456
export DB_PORT=5432
export DB_USERNAME=postgres


tfW9dZP3pj6mQYzFegNL72ECguwGb8uAzJn0StxqWCTGXcd+OsWXddTnu6uGDiv9
或者你也可以运行以下命令生成一个新的secret_key_base

mix phx.gen.secret

如果您以前已经部署过，请从先前的版本中删除静态资源
mix phx.digest.clean

export SECRET_KEY_BASE=fGsMhgJ0Cwdkqa/Wz07xEtS2/wqVSs26rYLwVrghCsfgN42VLH/oGVjv8Ujqr2Et

//rm -r deps _build .elixir_ls && mix deps.get.

brew services start postgresql

设置其他环境变量
配置客户端连接

BlockScout 目前支持 Parity, OpenAmazeChain, Geth, Nethermind, Hyperledger 客户端。

export ETHEREUM_JSONRPC_HTTP_URL="192.168.0.196:8069"
export ETHEREUM_JSONRPC_TRACE_URL="192.168.0.196:8069"
export ETHEREUM_JSONRPC_WS_URL="ws://192.168.0.196:8070"
export COIN=POA
export ETHEREUM_JSONRPC_HTTP_URL=192.168.0.196:8069
export ETHEREUM_JSONRPC_TRACE_URL=192.168.0.196:8069
export ETHEREUM_JSONRPC_WS_URL=ws://192.168.0.196:8070

========本地=============+++++=≠====
export COIN=POA
export ETHEREUM_JSONRPC_VARIANT=geth
export ETHEREUM_JSONRPC_HTTP_URL="http://localhost:8545"
export ETHEREUM_JSONRPC_WS_URL="ws://localhost:8545"
export ETHEREUM_JSONRPC_TRACE_URL="http://localhost:8545"
export BLOCK_TRANSFORMER=clique
export NETWORK="POA"
export MIX_ENV=prod

export DATABASE_URL=postgresql://postgres:123456@127.0.0.1:5432/block
export DB_HOST=127.0.0.1
export DB_PASSWORD=123456
export DB_PORT=5432
export DB_USERNAME=postgres


export COIN="Amc AmazeChain"
export NETWORK="Amc AmazeChain"
export SUBNETWORK="Amc AmazeChain"
export LOGO=/images/blockscout_logo.svg
export ETHEREUM_JSONRPC_VARIANT=geth
export BLOCK_TRANSFORMER=clique


export COIN="Amc AmazeChain"
export NETWORK="Amc AmazeChain"
export SUBNETWORK="Amc AmazeChain"
export LOGO=/images/blockscout_logo.svg

export COIN=POA
export NETWORK=POA
export SUBNETWORK=POA Sokol
export LOGO=/images/blockscout_logo.svg
export ETHEREUM_JSONRPC_VARIANT=geth
export BLOCK_TRANSFORMER=clique
export PORT=4200

//http://192.168.0.196:8069` 

//////=================////////
//测试服 192.68.0.196

export DATABASE_URL=postgresql://postgres:123456@127.0.0.1:5432/block
export DB_HOST=127.0.0.1
export DB_PASSWORD=123456
export DB_PORT=5432
export DB_USERNAME=postgres

export ETHEREUM_JSONRPC_HTTP_URL=192.168.0.196:8069
export ETHEREUM_JSONRPC_TRACE_URL=192.168.0.196:8069
export ETHEREUM_JSONRPC_WS_URL=ws://192.168.0.196:8070

export ETHEREUM_JSONRPC_HTTP_URL="192.168.0.196:8069"
export ETHEREUM_JSONRPC_TRACE_URL="192.168.0.196:8069"
export ETHEREUM_JSONRPC_WS_URL="ws://192.168.0.196:8070"

export COIN="Amc AmazeChain"
export NETWORK="Amc AmazeChain"
export SUBNETWORK="Amc AmazeChain"
export LOGO=/images/blockscout_logo.svg
export ETHEREUM_JSONRPC_VARIANT=geth
export BLOCK_TRANSFORMER=clique
export PORT=4200

export COIN=POA
export NETWORK=POA
export SUBNETWORK=POA Sokol
export LOGO=/images/blockscout_logo.svg
export ETHEREUM_JSONRPC_VARIANT=geth
export BLOCK_TRANSFORMER=clique
export PORT=4200

export MIX_ENV=prod

//////=================////////

安装Mix依赖，并对其进行编译
mix do deps.get, local.rebar --force, deps.compile, compile

# 或者你也可以将其拆解开之后执行，这样有助于更细致地查看运行信息

HEX_HTTP_CONCURRENCY=1 HEX_HTTP_TIMEOUT=120 mix deps.get

通过先运行修复它  mix local.hex
mix deps.get

rm -rf ~/.hex
 
mix do deps.get
mix do local.rebar --force


Devkinglory0
//
mix do deps.compile
mix do compile


创建和迁移数据库
mix do ecto.create
mix do ecto.migrate

ecto.drop将从数据库中删除所有数据。如果您不想丢失所有数据，请不要在生产中执行它！

mix do ecto.drop, ecto.create, ecto.migrate

安装 Node.js 依赖
cd apps/block_scout_web/assets
npm install && node_modules/webpack/bin/webpack.js --mode production
cd -

cd apps/explorer && npm install
cd -

建立用于部署的静态资产，执行命令
cd apps/block_scout_web/
mix phx.digest

启用HTTPS
cd apps/block_scout_web/x 
mix phx.gen.cert blockscout blockscout.local
cd -

127.0.0.1       localhost blockscout blockscout.local

255.255.255.255 broadcasthost
::1             localhost blockscout blockscout.local 


https://mainnet.infura.io/v3/f47d1726403b42deb67ba5e243c4f073

-->
<!-- 
cd apps/block_scout_web/
mix phx.gen.cert blockscout blockscout.local

vi /etc/hosts

::1 localhost   localhost.localdomain   localhost6  localhost6.localdomain6     blockscout blockscout.local
127.0.0.1   localhost   localhost.localdomain   localhost4  localhost4.localdomain4     blockscout blockscout.local -->

<!-- 
export DATABASE_URL="postgresql://postgres:postgres@localhost:5432/blockscout"
 
export DB_HOST=localhost
export DB_PASSWORD=postgres
export DB_PORT=5432
export DB_USERNAME=postgres

export SECRET_KEY_BASE="your key"

export ETHEREUM_JSONRPC_VARIANT=geth
export ETHEREUM_JSONRPC_HTTP_URL="http://localhost:8545"
export ETHEREUM_JSONRPC_WS_URL="ws://localhost:8545"
export SUBNETWORK= MAINNET
export PORT=4200
export COIN="Test Coin" 


export DATABASE_URL=postgresql://postgres:postgres@127.0.0.1:5432/postgres
export DB_HOST=127.0.0.1


export DATABASE_URL=postgresql://postgres:postgres@localhost:5432/postgres
export DB_HOST=localhost

export DB_PASSWORD=postgres

export DB_PORT=5432

export DB_USERNAME=postgres

export ETHEREUM_JSONRPC_VARIANT=geth
export ETHEREUM_JSONRPC_HTTP_URL="http://localhost:8545"
export ETHEREUM_JSONRPC_WS_URL="ws://localhost:8545"

export SUBNETWORK= MAINNET

export PORT=4200
export COIN="Test Coin"

-->

<!---
update 

     require Logger
      # Logger.info("=======usd_value======== #{exchange_rate.usd_value}")
      # Logger.info("market_history_data: #{inspect(recent_market_history)}")
      # Logger.info("exchange_rate: #{inspect(exchange_rate)}")

->

<!-- 
export NETWORK="Amc AmazeChain"
export SUBNETWORK=AmazeChain Explorer
export ETHEREUM_JSONRPC_VARIANT=geth
export BLOCK_TRANSFORMER=clique
export ETHEREUM_JSONRPC_HTTP_URL=http://198.200.30.37:8545
export ETHEREUM_JSONRPC_WS_URL=ws://198.200.30.37:8546
export ECTO_USE_SSL=false
export COIN=Amc
export PORT=4200
export LOGO=/images/blockscout_logo_amc.svg 
-->
