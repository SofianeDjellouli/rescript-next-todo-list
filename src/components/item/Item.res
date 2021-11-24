open MaterialUi
open Icons

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

  <ListItem button={true} className={styles["item"]}>
    <ListItemIcon>
      <IconButton edge={IconButton.Edge.start}>
        {if toggled {
          <Cancel onClick={handleToggle} />
        } else {
          <Edit onClick={handleToggle} />
        }}
      </IconButton>
    </ListItemIcon>
    {if toggled {
      <>
        <TextField onChange value={TextField.Value.string(value)} />
        <ListItemIcon> <Check onClick={handleUpdate} /> </ListItemIcon>
      </>
    } else {
      <>
        <ListItemText
          primary={React.string(todo.content)} style={ReactDOM.Style.make(~cursor="pointer", ())}
        />
      </>
    }}
    <ListItemSecondaryAction>
      <IconButton edge={IconButton.Edge._end}> <Delete onClick={handleDelete} /> </IconButton>
    </ListItemSecondaryAction>
  </ListItem>
}
