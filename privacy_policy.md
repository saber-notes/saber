# Privacy Policy - Saber

Saber is an application developed by Adil Hanney that
facilitates the user in creating and organising handwritten notes.

This privacy policy will change as the app evolves: you can view any changes on this page
and can track early progress through the
[Saber progress discussion](https://github.com/adil192/saber/discussions/1)
and the changelogs on the
[Releases](https://github.com/adil192/saber/releases) page.

## What data does the application use?

Data the application uses includes the user's:
- Notes
- Settings
- Online cloud service (referred to as "the cloud") credentials including:
  - the cloud server URI
  - the user's display name
  - the user's password to protect notes

The application seeks to access the least amount of data possible
and uses a zero-trust approach to cloud storage.
The application does not use any third-party tracking APIs.

## How is the cloud used?

The cloud is used to store and sync the user's notes and settings
between the user's devices but is not necessary for the application to function.

To use this feature, users need to make an account on a Nextcloud server
of their choice to use as a cloud service.
For users who don't want to choose a custom Nextcloud server,
the official Saber server — run by Adil Hanney — is hosted at
[nc.saber.adil.hanney.org](https://nc.saber.adil.hanney.org).

To maintain privacy, all notes are encrypted before being sent to the cloud.
A randomly generated key is used to encrypt the notes.
This key is stored on the user's device in secure storage,
and an encrypted form of the key is uploaded to the cloud.

## The official server ([link](https://nc.saber.adil.hanney.org))

Users have the option of using the Saber project's official server.
The server's files by default are able to be accessed by anyone who has access
to the server, including the server technicians and me (Adil Hanney).
This is why I have adopted a zero-trust approach so that the user's files
are solely accessible to the user regardless of which server they use.

## “Talk is cheap. Show me the code.”

The source code is free and open to the public under the
[GPLv3 license](https://github.com/adil192/saber/blob/main/LICENSE.md)
and is available on [GitHub](https://github.com/adil192/saber).
