XPTemplate priority=personal

XPT gpl " GPL 3 or later licens
// SPDX-FileCopyrightText: 2021 Jakub Pastuszek <jpastuszek@protonmail.com>
//
// SPDX-License-Identifier: GPL-3.0-or-later

XPT ddebug " derive Debug
#[derive(Debug)]

XPT idisp " impl Display
impl Display for `object^ {
	fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
		match self {
			`object^::`variant^ => write!(f, "`description^"`cursor^),
		}
	}
}

XPT ierror " impl Error
impl Error for `object^ {
	fn source(&self) -> Option<&(dyn Error + 'static)> {
		match self {
			`object^::`variant^ => `cursor^Some(err),
		}
	}
}

XPT ifrom " impl From
impl From<`from^> for `to^ {
	fn from(value: `from^) -> `to^ {
		`cursor^
	}
}

XPT itryfrom " impl TryFrom
impl TryFrom<`from^> for `to^ {
	type Error = `error^;

	fn try_from(value: `from^) -> Result<`to^, `error^> {
		Ok(`cursor^)
	}
}

XPT tblock " test block
#[cfg(test)]
mod tests {
	use super::*;

	#[test]
	fn test_`name^) {
		`cursor^
	}
}

XPT test " test function
	#[test]
	fn test_`name^) {
		`cursor^
	}
