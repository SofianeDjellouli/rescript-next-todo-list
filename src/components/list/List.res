@genType("List") @react.component
let make = () => {
  let (state, dispatch) = React.useReducer(State.reducer, State.defaultState)

  let {input, todos} = state

  let onChange = event => {
    let value = ReactEvent.Form.target(event)["value"]

    dispatch(InputChange({value: value}))
  }

  let handleDispatch = _ => dispatch(Add)

  let onKeyPress = event =>
    if ReactEvent.Keyboard.key(event) === "Enter" {
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
        {todos->Js.Array2.mapi((todo, i) => <Item key={i->Js.Int.toString} todo />)->React.array}
      </ol>
    }}
  </>
}
