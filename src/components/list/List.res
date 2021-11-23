@genType("List") @react.component
let make = () => {
  let (state, dispatch) = React.useReducer(State.reducer, State.defaultState)

  let {input, todos} = state

  let onChange = e => {
    let value = ReactEvent.Form.target(e)["value"]

    value->InputChange->dispatch
  }

  let handleDispatch = _ => {
    let length = Js.String.length(state.input)

    if length > 0 {
      dispatch(Add)
    } else {
      Webapi.Dom.Window.alert("Nothing to add!", Webapi.Dom.window)
    }
  }

  let onKeyPress = e =>
    if ReactEvent.Keyboard.key(e) === "Enter" {
      handleDispatch()
    }

  <>
    <div>
      <input value={input} onChange onKeyPress />
      <button onClick={handleDispatch}> {React.string("Add")} </button>
    </div>
    {if todos->Js.Array2.length == 0 {
      <p> {React.string("You haven't added anything to your list yet.")} </p>
    } else {
      <ol>
        {todos
        ->Js.Array2.mapi((todo, i) => <Item key={i->Js.Int.toString} todo dispatch i />)
        ->React.array}
      </ol>
    }}
  </>
}
