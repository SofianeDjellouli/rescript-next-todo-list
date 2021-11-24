module Add = {
  @react.component @module("@material-ui/icons/Add")
  external make: (~color: string=?, ~onClick: ReactEvent.Mouse.t => unit=?) => React.element =
    "default"
}

module Edit = {
  @react.component @module("@material-ui/icons/Edit")
  external make: (~color: string=?, ~onClick: ReactEvent.Mouse.t => unit=?) => React.element =
    "default"
}

module Delete = {
  @react.component @module("@material-ui/icons/Delete")
  external make: (~color: string=?, ~onClick: ReactEvent.Mouse.t => unit=?) => React.element =
    "default"
}

module Check = {
  @react.component @module("@material-ui/icons/Check")
  external make: (~color: string=?, ~onClick: ReactEvent.Mouse.t => unit=?) => React.element =
    "default"
}

module Cancel = {
  @react.component @module("@material-ui/icons/Cancel")
  external make: (~color: string=?, ~onClick: ReactEvent.Mouse.t => unit=?) => React.element =
    "default"
}
