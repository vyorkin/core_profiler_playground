open Core_profiler.Std_offline

module G = Timer.Group

let g1 = G.create ~name:"f1-f3"

let f1_start = G.add_probe g1 ~name:"f1-start" ()
let f1_end = G.add_probe g1 ~name:"f1-end" ()

let f2_start = G.add_probe g1 ~name:"f2-start" ()
let f2_end = G.add_probe g1 ~name:"f2-end" ()

let f3_start = G.add_probe g1 ~name:"f3-start" ()
let f3_end = G.add_probe g1 ~name:"f3-end" ()

let f1 () = Unix.sleepf 0.005; ()
let f2 () = Unix.sleepf 0.001; ()
let f3 () = ()

let func () =
  G.reset g1;
  Timer.record f1_start;
  f1 ();
  Timer.record f1_end;
  Timer.record f2_start;
  f2 ();
  Timer.record f2_end;
  Timer.record f3_start;
  f3 ();
  Timer.record f3_end

let () =
  for _i = 1 to 100 do
    func ()
  done
