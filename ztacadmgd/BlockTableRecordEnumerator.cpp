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
#include "BlockTableRecordEnumerator.h"

//-----------------------------------------------------------------------------
//- Template class that wraps GCHandle from mscorlib.dll
#include <gcroot.h>

//-----------------------------------------------------------------------------
//- autodesk interop header, to aid converting between unmanaged ObjectARX and managed ObjectARX.NET
#include "mgdinterop.h"

//-----------------------------------------------------------------------------
//ztmgd::DatabaseServices::BlockTableRecordEnumerator::BlockTableRecordEnumerator () 
//	: Autodesk::AutoCAD::Runtime::DisposableWrapper ((System::IntPtr)new AcDbBlockTableRecordIterator (), true)
//{
//}

//-----------------------------------------------------------------------------
ztmgd::DatabaseServices::BlockTableRecordEnumerator::BlockTableRecordEnumerator (System::IntPtr unmanagedPointer, bool bAutoDelete)
	: Autodesk::AutoCAD::Runtime::DisposableWrapper (unmanagedPointer, bAutoDelete)
{
}

bool ztmgd::DatabaseServices::BlockTableRecordEnumerator::MoveNext()
{
}

void ztmgd::DatabaseServices::BlockTableRecordEnumerator::Reset()
{
}

ObjectId ztmgd::DatabaseServices::BlockTableRecordEnumerator::Current::get()
{
}