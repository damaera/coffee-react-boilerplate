path = require 'path'
webpack = require 'webpack'

HtmlWebpackPlugin = require 'html-webpack-plugin'

HtmlWebpackPluginConfig = new HtmlWebpackPlugin
  template: './src/index.html',
  filename: 'index.html',
  inject: 'body'

module.exports =
  entry: './src/index.coffee'
  output:
    filename: 'index.bundle.js'
    path: path.resolve(__dirname, 'dist')
  module:
    rules: [
      {
        test: /\.coffee$/,
        use: [
          {
            loader: 'babel-loader'
            options:
              presets: ['env', 'react']
          }
          'coffee-loader'
        ],
        exclude: /node_modules/
      },
      {
        test: /\.css$/
        use: ['style-loader', 'css-loader']
      },
    ]
  plugins: [
    HtmlWebpackPluginConfig
  ]