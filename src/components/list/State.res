type state = {todos: array<Todo.t>, input: string}

let defaultState = {todos: [], input: ""}

type action = Add | Remove({id: int}) | InputChange({value: string})

let reducer = (state, action) =>
  switch action {
  | Add => {
      input: "",
      todos: state.todos->Js.Array2.concat([{content: state.input}]),
    }
  | Remove({id}) => {...state, todos: state.todos->Js.Array2.filteri((_, i) => i != id)}
  | InputChange({value}) => {...state, input: value}
  }
