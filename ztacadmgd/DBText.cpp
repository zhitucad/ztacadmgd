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
#include "DBText.h"

//-----------------------------------------------------------------------------
//- Template class that wraps GCHandle from mscorlib.dll
#include <gcroot.h>

//-----------------------------------------------------------------------------
//- autodesk interop header, to aid converting between unmanaged ObjectARX and managed ObjectARX.NET
#include "mgdinterop.h"

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::DBText::DBText () 
	: Autodesk::AutoCAD::DatabaseServices::Entity ((System::IntPtr)new AcDbText (), true)
{
}

//-----------------------------------------------------------------------------
ztAcadMgd::DatabaseServices::DBText::DBText (System::IntPtr unmanagedPointer, bool bAutoDelete)
	: Autodesk::AutoCAD::DatabaseServices::Entity (unmanagedPointer, bAutoDelete)
{
}

Point3d ztAcadMgd::DatabaseServices::DBText::AlignmentPoint::get()
{
	return ToPoint3d(GetImpObj()->alignmentPoint());
}

void ztAcadMgd::DatabaseServices::DBText::AlignmentPoint::set(Point3d value)
{
	int r = GetImpObj()->setAlignmentPoint(GETPOINT3D(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::DBText::Height::get()
{
	return GetImpObj()->height();
}

void ztAcadMgd::DatabaseServices::DBText::Height::set(double value)
{
	int r = GetImpObj()->setHeight(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

Vector3d ztAcadMgd::DatabaseServices::DBText::Normal::get()
{
	return ToVector3d(GetImpObj()->normal());
}

void ztAcadMgd::DatabaseServices::DBText::Normal::set(Vector3d value)
{
	int r = GetImpObj()->setNormal(GETVECTOR3D(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::DBText::Oblique::get()
{
	return GetImpObj()->oblique();
}

void ztAcadMgd::DatabaseServices::DBText::Oblique::set(double value)
{
	int r = GetImpObj()->setOblique(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

Point3d ztAcadMgd::DatabaseServices::DBText::Position::get()
{
	return ToPoint3d(GetImpObj()->position());
}

void ztAcadMgd::DatabaseServices::DBText::Position::set(Point3d value)
{
	int r = GetImpObj()->setPosition(GETPOINT3D(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::DBText::Rotation::get()
{
	return GetImpObj()->rotation();
}

void ztAcadMgd::DatabaseServices::DBText::Rotation::set(double value)
{
	int r = GetImpObj()->setRotation(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

String^ ztAcadMgd::DatabaseServices::DBText::TextString::get()
{
	return CIFToString(GetImpObj()->textString());
}

void ztAcadMgd::DatabaseServices::DBText::TextString::set(String^ value)
{
	int r = GetImpObj()->setTextString(StringToCIF(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

ObjectId^ ztAcadMgd::DatabaseServices::DBText::TextStyle::get()
{
	return ToObjectId(GetImpObj()->textStyle());
}

void ztAcadMgd::DatabaseServices::DBText::TextStyle::set(Autodesk::AutoCAD::DatabaseServices::ObjectId^ value)
{
	int r = GetImpObj()->setTextStyle(GETOBJECTID(value));
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

double ztAcadMgd::DatabaseServices::DBText::Thickness::get()
{
	return GetImpObj()->thickness();
}

void ztAcadMgd::DatabaseServices::DBText::Thickness::set(double value)
{
	int r = GetImpObj()->setThickness(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}

//TextVerticalMode ztAcadMgd::DatabaseServices::DBText::VerticalMode::get()
//{
//	return GetImpObj()->verticalMode();
//}
//
//void ztAcadMgd::DatabaseServices::DBText::VerticalMode::set(TextVerticalMode value)
//{
//	int r = GetImpObj()->setVerticalMode((int)value);
//	if (r != 0)
//	{
//		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
//	}
//}

double ztAcadMgd::DatabaseServices::DBText::WidthFactor::get()
{
	return GetImpObj()->widthFactor();
}

void ztAcadMgd::DatabaseServices::DBText::WidthFactor::set(double value)
{
	int r = GetImpObj()->setWidthFactor(value);
	if (r != 0)
	{
		throw gcnew Autodesk::AutoCAD::Runtime::Exception(safe_cast<Autodesk::AutoCAD::Runtime::ErrorStatus>(r));
	}
}