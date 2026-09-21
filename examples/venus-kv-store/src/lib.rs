use rialo_venus_proc_macro::rialo;

rialo! {
    workflow {
        state {
            present: bool,
            key: u64,
            value: u64,
            revision: u64,
        }

        program {
            use rialo_s_program::{
                entrypoint::ProgramResult,
                msg,
            };

            initiating fn set(&mut self, key: u64, value: u64) -> ProgramResult {
                self.present = true;
                self.key = key;
                self.value = value;
                self.revision += 1;

                msg!(
                    "kv set: key={} value={} revision={}",
                    self.key,
                    self.value,
                    self.revision
                );

                Ok(())
            }

            initiating fn get(&mut self, key: u64) -> ProgramResult {
                if self.present && self.key == key {
                    msg!(
                        "kv hit: key={} value={} revision={}",
                        self.key,
                        self.value,
                        self.revision
                    );
                } else {
                    msg!("kv miss: key={}", key);
                }

                Ok(())
            }

            initiating fn clear(&mut self) -> ProgramResult {
                self.present = false;
                self.key = 0;
                self.value = 0;
                self.revision += 1;

                msg!("kv cleared: revision={}", self.revision);

                Ok(())
            }
        }
    }
}
