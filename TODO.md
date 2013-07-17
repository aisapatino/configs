TO DO

plugins
  show git branch?

vimrc
	highlight statusline

theme
    more colors -- differentiate some things

status_checker
	bold/highlight when not on master branch

python
    maybe highlight return differently?

ruby

hi def link rubyClass			rubyDefine
hi def link rubyModule			rubyDefine
hi def link rubyMethodExceptional	rubyDefine
hi def link rubyDefine			Define
hi def link rubyFunction		Function
hi def link rubyConditional		Conditional
hi def link rubyConditionalModifier	rubyConditional
hi def link rubyExceptional		rubyConditional
hi def link rubyRepeat			Repeat
hi def link rubyRepeatModifier		rubyRepeat
hi def link rubyOptionalDo		rubyRepeat
hi def link rubyControl			Statement
hi def link rubyInclude			Include
hi def link rubyInteger			Number
hi def link rubyASCIICode		Character
hi def link rubyFloat			Float
hi def link rubyBoolean			Boolean
hi def link rubyException		Exception
if !exists("ruby_no_identifiers")
  hi def link rubyIdentifier		Identifier
else
  hi def link rubyIdentifier		NONE
endif
hi def link rubyClassVariable		rubyIdentifier
hi def link rubyConstant		Type
hi def link rubyGlobalVariable		rubyIdentifier
hi def link rubyBlockParameter		rubyIdentifier
hi def link rubyInstanceVariable	rubyIdentifier
hi def link rubyPredefinedIdentifier	rubyIdentifier
hi def link rubyPredefinedConstant	rubyPredefinedIdentifier
hi def link rubyPredefinedVariable	rubyPredefinedIdentifier
hi def link rubySymbol			Constant
hi def link rubyKeyword			Keyword
hi def link rubyOperator		Operator
hi def link rubyPseudoOperator		rubyOperator
hi def link rubyBeginEnd		Statement
hi def link rubyAccess			Statement
hi def link rubyAttribute		Statement
hi def link rubyEval			Statement
hi def link rubyPseudoVariable		Constant
