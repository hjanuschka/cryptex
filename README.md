as discussed on slack, here is the intial commit.


Goal:
===

beside the certificate files we already can store crypted in a git repo, there are other files we wan't to have crypted and stored in a git repo.
with `cryptex` one should be able to store files of all kinds, crypted on a git repo.


**This is a very alpha phase - feel free to comment and feedback - but do not use this PR*** 💣 


TODO:
===


  - [x] generate base files for `cryptex`
  - [ ] implement commands
  - [ ] implement fastlane actions
  - [ ] migrate the crypting part from  `match`  to fastlane_core (so we can reuse it in `cryptex`)
  - [ ] migrate repo-initialization from `match`   to fastlane_core (so we can reuse it in `cryptex`)
  - [ ] update README, assets, manual
  - [ ] add `specs/` tests 😍 




API proposal (COMMANDS):
===
  * initialize a git repo (sets up basic git repo):

```
cryptex -r git@git.januschka.com:fastlane/cryptex.git -m master_password init
```

  * Add a file or folder to the `cryptex` repo

> adding a already existing file should raise a error, if `--force` is not set

```
cryptex -r git@git.januschka.com:fastlane/cryptex.git -m master_password add folder1/panama_transfers.csv
```


  * get a file or folder from the cryptex stor:

```
cryptex -r git@git.januschka.com:fastlane/cryptex.git -m master_password get folder1/panama_transfer.csv path/to/destination/out.csv
```


  * decrypt the whole repo:

> clones the repo, and decrypts all files.

```
cryptex -r git@git.januschka.com:fastlane/cryptex.git -m master_password decrypt path/to/panama_leaks/
```

  * crypt full repo

> will commit changes and crypt the all files - so inbetween `decrypt`  and `crypt` you can read/write all files.

```
cryptex -r git@git.januschka.com:fastlane/cryptex.git -m master_password path/to/panama_leaks/ crypt
```


> As usual command line parameters will be able to get set via ENV (just noted them for demo purpose)



API Proposal (fastlane actions):
===

  * add file (adds&crypts a file to the repo)

> adding a already existing file should raise a error, if `--force` is not set

```
cryptex_add(
                    repo: "git@git.januschka.com:fastlane/cryptex.git",
                    password: "master_password",
                    filename: "path/to/panama_leaks.csv",
)
```

  * get file (pulls repo, decrypts file and puts decrypted version to `destination`

```
cryptex_get(
                    repo: "git@git.januschka.com:fastlane/cryptex.git",
                    password: "master_password",
                    filename: "path/to/panama_leaks.csv",
                    destination: "path/to/destination/out.csv"
)
```

  * full-decrypt
```
cryptex_decrypt(
                    repo: "git@git.januschka.com:fastlane/cryptex.git",
                    password: "master_password",
                    destination_folder: "/path/to/cloned/repo"
)

```

  * full-crypt
```
cryptex_crypt(
                    repo: "git@git.januschka.com:fastlane/cryptex.git",
                    password: "master_password",
                    repo_folder: "/path/to/cloned/repo"
)

```