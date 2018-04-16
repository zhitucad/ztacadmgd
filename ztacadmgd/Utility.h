#pragma once

class CUtility
{
public:
	CUtility(void);
	~CUtility(void);
	static const ACHAR* getValue(AcDbObject* object, const ACHAR* name);
	static Acad::ErrorStatus setValue(AcDbObject* object, const ACHAR* name, const ACHAR* value);
};