# Saber's Privacy Policy

Saber is an application developed by Adil Hanney that
facilitates the user in creating and organising handwritten notes.

This privacy policy may be updated from time to time.
You can view the latest privacy policy at
[saber.adil.hanney.org/privacy-policy](https://saber.adil.hanney.org/privacy-policy),
and you can view the history of changes to the privacy policy on
[GitHub](https://github.com/saber-notes/saber/commits/main/privacy_policy.md).

## On-device usage: What data does the application use?

The application seeks to access the least amount of data possible
and uses a zero-trust approach to cloud storage.

Data the application uses includes the user's:
- Notes (including images and backgrounds): Used for the main functionality of the application
- In-app settings: Used to customise the application to the user's preferences
- Online cloud service (referred to as "the cloud") credentials including the server URI, username, and passwords: Used to enable syncing between devices
- Data used with/for third-party services, as described below

## Third-party service: How is the cloud used?

The cloud is used to store and sync the user's notes and settings
between the user's devices but is not necessary for the application to function.

To use this feature, users need to make an account on a Nextcloud server
of their choice to use as a cloud service.
For users who don't want to choose a custom Nextcloud server,
the official Saber server is hosted at
[nc.saber.adil.hanney.org](https://nc.saber.adil.hanney.org).
This server is run by me (Adil Hanney) and hosted in the European Union (The Netherlands).

To maintain privacy, all notes are encrypted before being sent to the cloud.
A randomly generated key is used to encrypt the notes.
This key and password are stored on the user's device in secure storage,
and an encrypted form of the key is uploaded to the cloud.

### My notes are private, right?

With any cloud storage, the server owners can see and read any files you upload.
This is why Saber encrypts your notes before uploading them to the cloud,
so they're unreadable to the server owner.

### So what data can the server owners see?

- All information provided during the sign-up process, including but not limited to your username and email address.
- Information about any device that connects to the server, including but not limited to the device's operating system, browser, and IP address.
- An encrypted (scrambled) form of your notes. The server owner cannot read the notes, but they can see metadata like:
  - The size of each note.
  - The number of notes you have.
  - The encrypted names of your notes.
  - The last time you edited a note, when it was created, and when you last synced.
- An encrypted (scrambled) form of your encryption key. This is required to enable cross-device syncing.
- Nextcloud is general-purpose software, so the server owner can see any other files you upload
  to the server and information you provide outside of Saber.

## Third-party service: Error tracking

To help diagnose and fix errors in the application,
Saber uses [Sentry](https://sentry.io), an open-source SDK, to
automatically collect error reports.

This data collection is optional and opt-in. No data collection occurs until
the user grants consent and the app is restarted. You can opt in or out at any
time in the app settings, and changes take effect after the app is restarted.

The data shared includes:
- Information about the device like the operating system, model, and specifications.
- Information about the application like the version number and build environment.
- Error messages, stack traces, and other debugging information.
- A randomly-generated identifier used to group errors. This cannot be linked to your specific account or device and is regenerated if you reinstall the app.

Data not shared includes:
- Personal information like your username or email address.
- The contents of your notes like pen strokes and images.
- Passwords and encryption keys.
- The domain name of the Nextcloud server you use.
- Persistent device identifiers like your advertising ID, IMEI, or serial number.

Data is sent to Sentry's servers in the European Union (EU).
Sensitive data is removed locally before being sent to Sentry, and
additional data scrubbing is applied on the server to further anonymise the data.
Sentry handles data in accordance with
[Sentry's privacy policy](https://sentry.io/privacy/).

## Third-party service: Ads

Saber has been ad-free since September 2024.
If you are using a version of the application older than v0.4.7,
please update to the latest version.

## “Talk is cheap. Show me the code.”

The source code is free and open to the public under the
[GPLv3 license](https://github.com/saber-notes/saber/blob/main/LICENSE.md)
and is available on [GitHub](https://github.com/saber-notes/saber).

## How can I delete my data?

1. To delete the local data on your device, simply uninstall the application.
  Desktop users will also need to delete the `Saber` folder inside your Documents folder.

2. To delete your account and data on the cloud:
    - If you use the default cloud provider, you can head to the
      [account deletion page](https://nc.saber.adil.hanney.org/index.php/settings/user/drop_account)
      by going to Settings then "Delete account". You'll get an email with a link to confirm
      the deletion of your account. Once you click the link, your account will be deleted after
      a 1 week grace period. If you change your mind, contact me at
      [adilhanney@disroot.org](mailto:adilhanney@disroot.org) and I'll cancel the deletion.
    - If you use a third-party Nextcloud server, there may be a "Delete account" option in the Settings.
      If not, you may need to contact the server administrator to delete your account.
      You should see the server's privacy policy for more information.

3. Sentry: Error logs are already anonymised and it is impossible to identify/delete reports from a specific user or device. If you want to stop further reports, you can disable error tracking in the app settings.

### Unused accounts

To conserve storage space, accounts on the official Saber server that have not been used for over 365 days may be deleted automatically.

You will receive notifications via email 300, 330, and 360 days after your last login,
giving you the opportunity to log in and prevent deletion if you wish to keep your account.

If you are using another Nextcloud server, please refer to that server's privacy policy or terms of service for information on account deletion policies.

## Privacy point of contact

This application is developed by Adil Hanney.
You can contact me at [adilhanney@disroot.org](mailto:adilhanney@disroot.org) for any enquiries,
or [create an issue](https://github.com/saber-notes/saber/issues/new/choose)
on this repo (requires a GitHub account).
