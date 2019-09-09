open Core
open Core_profiler.Std_offline

module G = Timer.Group

let g = G.create ~name:"func"

let p1 = G.add_probe g ~name:"p1" ()
let p2 = G.add_probe g ~name:"p2" ()
let px = G.add_probe g ~name:"px" ()

let func () =
  G.reset g;
  Timer.record p1;
  let len = 100 in
  let key = Random.int 100 in
  if key mod 3 <> 0 then begin
    ignore (Array.create ~len 10);
    Timer.record p2;
  end;
  Timer.record px

let () =
  for _i = 1 to 10_000_000 do
    func ();
  done
