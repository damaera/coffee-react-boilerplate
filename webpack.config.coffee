path = require 'path'
webpack = require 'webpack'

HtmlWebpackPlugin = require 'html-webpack-plugin'
ExtractTextPlugin = require 'extract-text-webpack-plugin'

isProduction = process.env.NODE_ENV is 'production'

cssDev = ['style-loader', 'css-loader']
cssProd = ExtractTextPlugin.extract
  fallback: 'style-loader'
  use: ['css-loader']
  publicPath: '/dist'

cssConfig = if isProduction then cssProd else cssDev

HtmlWebpackPluginConfig = new HtmlWebpackPlugin
  template: './src/index.html'
  filename: 'index.html'
  hash: true

module.exports =
  entry: './src/index.coffee'
  output:
    filename: 'index.bundle.js'
    path: path.resolve(__dirname, 'dist')
  devServer:
    contentBase: path.join(__dirname, 'dist'),
    compress: true
    hot: true
    open: true
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
        use: cssConfig
      },
    ]
  plugins: [
    HtmlWebpackPluginConfig
    new ExtractTextPlugin
      filename: 'app.css'
      disable: !isProduction
      allChunks: true
    new webpack.HotModuleReplacementPlugin()
    new webpack.NamedModulesPlugin()
  ]