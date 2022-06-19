# next

Yet another to-do application.

## Installation

    stack install

This installs the executable `nn` for the current user.

### Usage

Next organizes tasks to be done in separate contexts. Typical contexts might
be "work" and "private". The default context is aptly named "default". To get
the name of the active context, run

    nn context

To rename the current context to "work", run

    nn context -r work

To create a new context called "private" and switch to it, run

    nn context -n private

To switch back to the work context

    nn context work


