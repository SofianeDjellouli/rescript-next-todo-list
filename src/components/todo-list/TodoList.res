open MaterialUi

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(State.reducer, State.defaultState)

  let {input, todos} = state

  let onChange = e => {
    let value = ReactEvent.Form.target(e)["value"]

    value->InputChange->dispatch
  }

  let handleSubmit = e => {
    ReactEvent.Form.preventDefault(e)

    let length = Js.String.length(state.input)

    if length > 0 {
      dispatch(Add)
    } else {
      Webapi.Dom.Window.alert("Nothing to add!", Webapi.Dom.window)
    }
  }

  <>
    <form onSubmit={handleSubmit}>
      <TextField onChange value={TextField.Value.string(input)} />
      <Button variant=#Contained _type={Button.Type.string("submit")}>
        {React.string("Add")}
      </Button>
    </form>
    {if todos->Js.Array2.length == 0 {
      <p> {React.string("You haven't added anything to your list yet.")} </p>
    } else {
      <List>
        {todos
        ->Js.Array2.mapi((todo, i) => <Item key={i->Js.Int.toString} todo dispatch i />)
        ->React.array}
      </List>
    }}
  </>
}
