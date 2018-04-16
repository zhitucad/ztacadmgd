using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Autodesk.AutoCAD.Runtime;
using Autodesk.AutoCAD.DatabaseServices;
using Autodesk.AutoCAD.Geometry;
[assembly: CommandClass(typeof(ztAcadMgd.test.Class1))]

namespace ztAcadMgd.test
{
    public class Class1
    {
        [CommandMethod("test")]
        public static void test()
        {
            Database db = Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument.Database;
            Transaction t = db.TransactionManager.StartTransaction();
            ObjectId dtoi = ObjectId.Null;
            try
            {
                DBDictionary dbd = (DBDictionary)t.GetObject(db.NamedObjectsDictionaryId, OpenMode.ForWrite, false);
                DBDictionary d = null;
                if (!dbd.Contains("测试"))
                {
                    d = new DBDictionary();
                    ObjectId oi = dbd.SetAt("测试", d);
                    t.AddNewlyCreatedDBObject(d, true);
                }
                else
                {
                    ObjectId oi = dbd.GetAt("测试");
                    d = (DBDictionary)t.GetObject(oi, OpenMode.ForWrite, false);
                }
                DataTable dt = new DataTable();
                dtoi = d.SetAt("1", dt);
                t.AddNewlyCreatedDBObject(dt, true);
                t.Commit();
            }
            finally
            {
                t.Dispose();
            }
            t = db.TransactionManager.StartTransaction();
            try
            {
                BlockTable bt = (BlockTable)t.GetObject(db.BlockTableId, OpenMode.ForRead, false);
                BlockTableRecord btr = (BlockTableRecord)t.GetObject(bt[BlockTableRecord.ModelSpace], OpenMode.ForWrite, false);
                ztAcadMgd.DatabaseServices.Line l = new ztAcadMgd.DatabaseServices.Line(new Point3d(), new Point3d(10, 10, 0));
                btr.AppendEntity(l);
                t.AddNewlyCreatedDBObject(l, true);
                l.AddPersistentReactor(dtoi);
                for (int i = 0; i < l.GetPersistentReactorIds().Count; i++)
                {
                    DBObject dbo = t.GetObject(l.GetPersistentReactorIds()[i], OpenMode.ForRead, false);
                    Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument.Editor.WriteMessage("\n" + dbo.GetRXClass().Name);
                }
                l.SetValue("属性", "直线");
                Autodesk.AutoCAD.ApplicationServices.Application.DocumentManager.MdiActiveDocument.Editor.WriteMessage("\n" + l.GetValue("属性"));
                t.Commit();
            }
            finally
            {
                t.Dispose();
            }
        }
    }
}
