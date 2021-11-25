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
      <List>
        <ListItem>
          <TextField onChange value={TextField.Value.string(input)} autoFocus={true} />
          <ListItemSecondaryAction>
            <Tooltip title={React.string("Add")}>
              <IconButton _type={IconButton.Type.string("submit")} edge={IconButton.Edge._end}>
                <Icons.Add />
              </IconButton>
            </Tooltip>
          </ListItemSecondaryAction>
        </ListItem>
      </List>
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
