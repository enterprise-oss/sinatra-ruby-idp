const {sassPlugin} = require("esbuild-sass-plugin");

require('esbuild')
  .build({
    "entryPoints": [
      "./src/index.tsx",
      "./src/styles/main.scss"
    ],
    "logLevel": "debug",
    "outdir": "public",
    "sourcemap": true,
    "bundle": true,
    "inject": [
      "./react-shim.js"],
    minify: true,
    plugins: [sassPlugin(),]
  })
  .then(() => console.log('⚡ Done'))
  .catch(() => process.exit(1))
