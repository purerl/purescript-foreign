-module(foreign_keys@foreign).
-export([unsafeKeys/1]).

% Nothing is currently typed as "object", which the purs guards on
unsafeKeys(_Object) -> [].