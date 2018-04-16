// (C) Copyright 2005-2007 by Autodesk, Inc. 
//
// Permission to use, copy, modify, and distribute this software in
// object code form for any purpose and without fee is hereby granted, 
// provided that the above copyright notice appears in all copies and 
// that both that copyright notice and the limited warranty and
// restricted rights notice below appear in all supporting 
// documentation.
//
// AUTODESK PROVIDES THIS PROGRAM "AS IS" AND WITH ALL FAULTS. 
// AUTODESK SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF
// MERCHANTABILITY OR FITNESS FOR A PARTICULAR USE.  AUTODESK, INC. 
// DOES NOT WARRANT THAT THE OPERATION OF THE PROGRAM WILL BE
// UNINTERRUPTED OR ERROR FREE.
//
// Use, duplication, or disclosure by the U.S. Government is subject to 
// restrictions set forth in FAR 52.227-19 (Commercial Computer
// Software - Restricted Rights) and DFAR 252.227-7013(c)(1)(ii)
// (Rights in Technical Data and Computer Software), as applicable.
//

//-----------------------------------------------------------------------------
#include "StdAfx.h"
#include "Line.h"

//-----------------------------------------------------------------------------
//- Template class that wraps GCHandle from mscorlib.dll
#include <gcroot.h>

//-----------------------------------------------------------------------------
//- autodesk interop header, to aid converting between unmanaged ObjectARX and managed ObjectARX.NET
#include "mgdinterop.h"

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::Line::Line () 
	: ztAcadMgd::DatabaseServices::Curve ((System::IntPtr)new AcDbLine (), true)
{
}

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::Line::Line (System::IntPtr unmanagedPointer, bool bAutoDelete)
	: ztAcadMgd::DatabaseServices::Curve (unmanagedPointer, bAutoDelete)
{
}

ztAcadMgd::DatabaseServices::Line::Line(Point3d pointer1, Point3d pointer2)
	: Curve((IntPtr)new AcDbLine(GETPOINT3D(pointer1), GETPOINT3D(pointer2)), true)
{

}

Point3d ztAcadMgd::DatabaseServices::Line::EndPoint::get()
{
	return ToPoint3d(GetImpObj()->endPoint());
}

void ztAcadMgd::DatabaseServices::Line::EndPoint::set(Point3d value)
{
	int r = GetImpObj()->setEndPoint(GETPOINT3D(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

Point3d ztAcadMgd::DatabaseServices::Line::StartPoint::get()
{
	return ToPoint3d(GetImpObj()->startPoint());
}

void ztAcadMgd::DatabaseServices::Line::StartPoint::set(Point3d value)
{
	int r = GetImpObj()->setStartPoint(GETPOINT3D(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

String^ ztAcadMgd::DatabaseServices::Line::GetValue(String^ Name)
{
    return CIFToString(CUtility::getValue(GetImpObj(), StringToCIF(Name)));
}

void ztAcadMgd::DatabaseServices::Line::SetValue(String^ Name, String^ Value)
{
    Autodesk::AutoCAD::Runtime::Interop::Check(CUtility::setValue(GetImpObj(), StringToCIF(Name), StringToCIF(Value)));
}

void ztAcadMgd::DatabaseServices::Line::AddPersistentReactor(Autodesk::AutoCAD::DatabaseServices::ObjectId oi)
{
    GetImpObj()->addPersistentReactor(GETOBJECTID(oi));
}

void ztAcadMgd::DatabaseServices::Line::RemovePersistentReactor(Autodesk::AutoCAD::DatabaseServices::ObjectId oi)
{
    GetImpObj()->removePersistentReactor(GETOBJECTID(oi));
}