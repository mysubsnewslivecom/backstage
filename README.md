# [Backstage](https://backstage.io)

This is your newly scaffolded Backstage App, Good Luck!

To start the app, run:

```sh
yarn install
yarn dev
BACKEND_SECRET=$(node -p 'require("crypto").randomBytes(24).toString("base64")')
```

```sh

docker image build . -f packages/backend/Dockerfile --tag backstage

dexec -d --name backend --env-file .env backstage

docker image build . -f packages/backend/Dockerfile --tag ui
 
dexec -d --name backend --env-file .env backstage

```
