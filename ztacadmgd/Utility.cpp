#include "StdAfx.h"
#include "Utility.h"

CUtility::CUtility(void)
{
}


CUtility::~CUtility(void)
{
}

const ACHAR* CUtility::getValue(AcDbObject* object, const ACHAR* name)
{
	AcDbObjectId extDictId = object->extensionDictionary();
	if (extDictId == AcDbObjectId::kNull)
		return _T("");
	AcDbDictionary* extDict;
    Acad::ErrorStatus es = acdbOpenObject(extDict, extDictId, AcDb::kForRead);
    if (es != Acad::eOk)
		return _T("");
	AcDbDictionary *pDict;
    es = extDict->getAt(_T("THCAD"), (AcDbObject*&)pDict, AcDb::kForRead);
	extDict->close();
	if (es == Acad::eKeyNotFound)
		return _T("");
	AcDbXrecord *pXrec;
    es = pDict->getAt(name, (AcDbObject*&) pXrec, AcDb::kForRead);
    pDict->close();
    if (es == Acad::eKeyNotFound)
		return _T("");
	struct resbuf *pRbList;
    pXrec->rbChain(&pRbList);
    pXrec->close();
	ACHAR* value;
	int i;
	for (i = 0; pRbList != NULL; i++, pRbList = pRbList->rbnext) {
		if (pRbList->restype == 1)
		value = pRbList->resval.rstring;
	}
    acutRelRb(pRbList);
	return value;
}

Acad::ErrorStatus CUtility::setValue(AcDbObject* object, const ACHAR* name, const ACHAR* value)
{
	AcDbObjectId extDictId = object->extensionDictionary();
    if (extDictId == AcDbObjectId::kNull) {
        Acad::ErrorStatus es = object->createExtensionDictionary();
		if (es != Acad::eOk)
			return Acad::eNotApplicable;
        extDictId = object->extensionDictionary();
    }
	AcDbDictionary* extDict;
    Acad::ErrorStatus es = acdbOpenObject(extDict, extDictId, AcDb::kForWrite);
    if (es != Acad::eOk)
		return Acad::eNotApplicable;
	AcDbDictionary *pDict;
	if (extDict->getAt(_T("THCAD"), (AcDbObject*&) pDict, AcDb::kForWrite) == Acad::eKeyNotFound)
    {
        pDict = new AcDbDictionary;
        AcDbObjectId DictId;
        extDict->setAt(_T("THCAD"), pDict, DictId);
    }
	extDict->close();
	AcDbXrecord *pXrec;
	if (pDict->getAt(name, (AcDbObject*&) pXrec, AcDb::kForWrite) == Acad::eKeyNotFound)
	{
		pXrec = new AcDbXrecord;
		AcDbObjectId xrecObjId;
		pDict->setAt(name, pXrec, xrecObjId);
	}
	struct resbuf *pHead;
    pHead = acutBuildList(AcDb::kDxfText, value, 0);
    pXrec->setFromRbChain(*pHead);
    acutRelRb(pHead);
    pXrec->close();
	pDict->close();
	return Acad::eOk;
}