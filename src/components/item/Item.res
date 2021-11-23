open MaterialUi

@module external styles: {..} = "./index.module.scss"

@react.component
let make = (~todo: Todo.t, ~dispatch: State.action => unit, ~i: int) => {
  let (toggled, toggle) = UseToggle.useToggle()

  let (value, setValue) = React.useState(_ => todo.content)

  let onChange = e => {
    let value = ReactEvent.Form.target(e)["value"]

    setValue(value)
  }

  let handleUpdate = _ => {
    {value: value, i: i}->Update->dispatch

    toggle()
  }

  let handleDelete = _ => i->Remove->dispatch

  React.useEffect1(() => {
    setValue(_ => todo.content)

    None
  }, [todo.content])

  let handleToggle = _ => toggle()

  <ListItem className={styles["item"]}>
    {if toggled {
      <>
        <TextField onChange value={TextField.Value.string(value)} />
        <ListItemSecondaryAction>
          <Spread props={"onClick": handleToggle}>
            <ListItemText primary={React.string("Cancel")} />
          </Spread>
          <Spread props={"onClick": handleUpdate}>
            <ListItemText primary={React.string("Confirm")} />
          </Spread>
        </ListItemSecondaryAction>
      </>
    } else {
      <>
        <ListItemText primary={React.string(todo.content)} />
        <ListItemSecondaryAction>
          <Spread props={"onClick": handleToggle}>
            <ListItemText primary={React.string("Change")} />
          </Spread>
          <Spread props={"onClick": handleDelete}>
            <ListItemText primary={React.string("Delete")} />
          </Spread>
        </ListItemSecondaryAction>
      </>
    }}
  </ListItem>
}
