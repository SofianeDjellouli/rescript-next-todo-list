open MaterialUi
open Icons

@module external styles: {..} = "./index.module.scss"

@react.component
let make = (~todo: State.todo, ~dispatch: State.action => unit, ~i: int) => {
  let {opened, content} = todo

  let (value, setValue) = React.useState(_ => content)

  let onChange = e => {
    let value = ReactEvent.Form.target(e)["value"]

    setValue(value)
  }

  let handleUpdate = _ => {value: value, i: i}->Update->dispatch

  let handleDelete = _ => i->Remove->dispatch

  let handleToggle = _ => i->Toggle->dispatch

  let handleListItemClick = _ => {
    if !opened {
      handleToggle()
    }
  }

  let handleCancel = _ => {
    handleToggle()

    setValue(_ => content)
  }

  <ListItem button={true} className={styles["item"]} onClick={handleListItemClick}>
    {if opened {
      <>
        <TextField onChange value={TextField.Value.string(value)} autoFocus={true} />
        <ListItemIcon>
          <Tooltip title={React.string("Confirm")}> <Check onClick={handleUpdate} /> </Tooltip>
        </ListItemIcon>
        <ListItemSecondaryAction>
          <Tooltip title={React.string("Cancel")}>
            <IconButton edge={IconButton.Edge._end} onClick={handleCancel}> <Cancel /> </IconButton>
          </Tooltip>
        </ListItemSecondaryAction>
      </>
    } else {
      <>
        <ListItemText
          primary={React.string(content)} style={ReactDOM.Style.make(~cursor="pointer", ())}
        />
        <ListItemSecondaryAction>
          <Tooltip title={React.string("Delete")}>
            <IconButton edge={IconButton.Edge._end} onClick={handleDelete}> <Delete /> </IconButton>
          </Tooltip>
        </ListItemSecondaryAction>
      </>
    }}
  </ListItem>
}
