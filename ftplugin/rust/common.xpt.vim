XPTemplate priority=personal

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
