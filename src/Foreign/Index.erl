-module(foreign_index@foreign).
-export([unsafeReadPropImpl/0, unsafeHasOwnProperty/0, unsafeHasProperty/0]).

% There is no "object". Let's work for maps (typeOf is "map")
unsafeReadPropImpl() ->
    fun (_F, S, Key, Value) when is_map(Value) ->
            S(maps:get(Key, Value, undefined));
        (F, _S, _Key, _Value) ->
            F
    end.

% There is no "object", working for "map" instead.
unsafeHasOwnProperty() -> unsafeHasProperty().

% There is no "object", working for "map" instead.
unsafeHasProperty() ->
    fun (Prop, Value) when is_map(Value) ->
        maps:is_key(Prop, Value)
    end.
