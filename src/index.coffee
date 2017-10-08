import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import App from './App.coffee'

import './App.css'

if module.hot
  module.hot.accept './App.coffee', () =>
    NextApp = require('./App.coffee').default
    ReactDOM.render <NextApp />, document.getElementById('root')

ReactDOM.render <App />, document.getElementById 'root'