import React, { Component } from 'react'

class App extends Component
  constructor: ->
    super()
    @state =
      counter: 0

  _increment: (e) =>
    @setState
      counter: @state.counter + 1

  _decrement: (e) =>
    @setState
      counter: @state.counter - 1

  render: ->
    <div>
      <h1>{ @state.counter }</h1>
      <h3>Hello world</h3>
      <button onClick={ @_decrement }>Decrement</button>
      <button onClick={ @_increment }>Increment</button>
    </div>

export default App