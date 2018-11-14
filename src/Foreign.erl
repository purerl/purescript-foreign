-module(foreign@foreign).
-export([unsafeToForeign/1, unsafeFromForeign/1, typeOf/1, tagOf/1, isNull/1, isUndefined/1, isArray/1]).

unsafeToForeign(X) -> X.

unsafeFromForeign(X) -> X.

typeOf(X) when is_integer(X) -> <<"integer">>;
typeOf(X) when is_float(X) -> <<"float">>;
typeOf(X) when is_boolean(X) -> <<"boolean">>;
typeOf(X) when is_atom(X) -> <<"atom">>;
typeOf(X) when is_binary(X) -> <<"binary">>;
typeOf(X) when is_bitstring(X) -> <<"bitstring">>;
typeOf(X) when is_list(X) -> <<"list">>;
typeOf(X) when is_map(X) -> <<"map">>;
typeOf(X) when is_tuple(X) -> <<"tuple">>;
typeOf(X) when is_pid(X) -> <<"pid">>;
typeOf(X) -> <<"term">>.

tagOf(X) -> typeOf(X).

isNull(null) -> true;
isNull(_) -> false.

isUndefined(undefined) -> true;
isUndefined(_) -> false.

isArray(X) -> array:is_array(X).