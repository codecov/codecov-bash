## Purpose
What is the context of this pull request? Why is it being done?

## Notable Changes
Are there any changes that need to be called out as particularly tricky or significant?

## Tests and Risks?
Is this covered by existing tests? New ones? If no, why not?

## Update the SHA hash files

Also make sure that you update all the hash files by running `for i in 1 256 512; do shasum -a "${i}" codecov > "SHA${i}SUM"; done`.
