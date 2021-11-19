// Generated by ReScript, PLEASE EDIT WITH CARE


var defaultState_todos = [];

var defaultState = {
  todos: defaultState_todos,
  input: ""
};

function reducer(state, action) {
  if (typeof action === "number") {
    return {
            todos: state.todos.concat([{
                    content: state.input
                  }]),
            input: ""
          };
  }
  if (action.TAG !== /* Remove */0) {
    return {
            todos: state.todos,
            input: action.value
          };
  }
  var id = action.id;
  return {
          todos: state.todos.filter(function (param, i) {
                return i !== id;
              }),
          input: state.input
        };
}

export {
  defaultState ,
  reducer ,
  
}
/* No side effect */
