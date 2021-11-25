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
                    content: state.input,
                    opened: false
                  }]),
            input: ""
          };
  }
  switch (action.TAG | 0) {
    case /* Remove */0 :
        var i = action._0;
        return {
                todos: state.todos.filter(function (param, index) {
                      return index !== i;
                    }),
                input: state.input
              };
    case /* InputChange */1 :
        return {
                todos: state.todos,
                input: action._0
              };
    case /* Update */2 :
        var i$1 = action.i;
        var value = action.value;
        return {
                todos: state.todos.map(function (todo, index) {
                      if (i$1 === index) {
                        return {
                                content: value,
                                opened: false
                              };
                      } else {
                        return todo;
                      }
                    }),
                input: state.input
              };
    case /* Toggle */3 :
        var i$2 = action._0;
        return {
                todos: state.todos.map(function (e, index) {
                      var opened = i$2 === index ? !e.opened : false;
                      return {
                              content: e.content,
                              opened: opened
                            };
                    }),
                input: state.input
              };
    
  }
}

export {
  defaultState ,
  reducer ,
  
}
/* No side effect */
