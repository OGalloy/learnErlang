-module(proc).
-export([call_back/0]).

call_back()->
    receive
        hello ->
            io:format("CallBack: hello ~n", []),
            call_back();
        _ ->
            io:format("Error~n"),
            call_back()
    end.
