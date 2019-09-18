open Core
open Core_profiler.Std_offline

let t1 = Delta_timer.create ~name:"t1"
let t2 = Delta_timer.create ~name:"t2"

let func () =
  Delta_timer.start t1;
  let len = Random.int 1000 in
  ignore (Array.create ~len 10);
  Delta_timer.start t2;
  let len = Random.int 100 in
  ignore (Array.create ~len 10);
  Delta_timer.stop t2;
  Delta_timer.stop t1

let () =
  for _i = 1 to 10_000 do
    func ()
  done
