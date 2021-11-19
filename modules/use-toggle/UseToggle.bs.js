// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";

function useToggle(defaultOpt, param) {
  var $$default = defaultOpt !== undefined ? defaultOpt : false;
  var match = React.useState(function () {
        return $$default;
      });
  var setToggled = match[1];
  var toggle = function (param) {
    return Curry._1(setToggled, (function (current) {
                  return !current;
                }));
  };
  return [
          match[0],
          toggle
        ];
}

export {
  useToggle ,
  
}
/* react Not a pure module */
