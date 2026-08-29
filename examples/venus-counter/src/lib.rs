use rialo_venus_proc_macro::rialo;

rialo! {
    workflow {
        state {
            counter: u64,
        }

        program {
            use rialo_s_program::{
                entrypoint::ProgramResult,
                msg,
            };

            initiating fn start(&mut self, amount: u64) -> ProgramResult {
                self.counter += amount;
                Ok(())
            }
        }
    }
}
